<h1 style="color: Grey">🌜 Dell-Night-Light</h1>

Dell Night Light is a tool with wich one can schedule brightness and color temperature changes of ones Dell display.
It supports lining up the schedule with your local sun set and rise time. 

<br> 

## 1. Requirements analysis 

---

### User Stories

> As a User, i want my monitor to automatically adjust brightness whenever it gets dark, so that i don't have to myself.

>As a User, i want my computer so spear my eyes with warm colors, when the sun has set.


### Requirements

#### Functional requirements

- The program must save the brightness level and color temperature as a state, in order to read it on the next start up.
- The program must have the ability to retreive local sun set and rise times based on the region code of the machine its running on.
- The program must be able to parse datetime input and be able to handle false input (-formats). It should show errors accordingly.
- The application should provide a intuitive graphical user interface, in order to be accessible to a large variety of users.

#### Non-functional requirements

- The input processing should not slow the application down nor interupt interaction flow.
- The user should be able to pick color temps from a expandable list.
- If the brightness of the display is set to below 25%, the application should present itself in dark mode.

<br>

## 2. Modelling

---

### Use Cases

![use_case_diagram](./diagrams/use_cases_diagram.png)

Wie soll ein UseCase Diagramm in Tabellenform aussehen??

### Classdiagram

```mermaid
    classDiagram
        direction TB
        
        class View
        <<GUI>> View
        View : +View() void
        View : -LoadValues() void
        View : -StoreValues() void
        View : -Model Model {mandatory} 
        View : -Bool DialogResult {mandatory} 
        View : -Hashtable~Control~ Controls {mandatory}
        class Control {
            <<enumeration>>
            ConfirmButton
            CancelButton
            LocalTimesCheckBox
            DayTimeTextBox
            NightTimeTextBox
            DayBrightnessTextBox
            NightBrightnessTextBox
            DayColorComboBox
            NightColorComboBox
        }
        class Main

        class Model
        <<DataManagement>> Model
        Model : -PSCustomObject Store {mandatory}
        Model : +Model() void
        Model : +WriteValuesToDataBase() void
        Model : +GetDayTime() string
        Model : -SetDayTime() void
        Model : +GetNightTime() string
        Model : -SetNightTime() void
        Model : +GetBrightnessDay() int
        Model : -SetBrightnessDay() void
        Model : +GetBrightnessNight() string
        Model : -SetBrightnessNight() int
        
        
        class Controller{
            <<BusinessLogic>>
            Controller : +CreateTask() void
            Controller : +AdjustMonitorSettings() void
        }

        View ..> Model : <<<read>read>>
        View "1" --o "1" Main
        Model "1" --o "1" Main
        Controller "1" --o "1" Main

```

### Objectdiagram

```mermaid
    classDiagram
        class View
        View : Controls = 
        View : Model = Model
        View : DialogResult = True

        class Model
        Model : Store = { day = { time = "0800", brightness = 50 }, night = { time = "0800", brightness = 50 }}

        class Controller

        class Main

        View --o Main
        Model --o Main
        Controller --o Main
```

### State-diagram

```mermaid
    stateDiagram
        direction LR

        state Initial
        state Decision <<choice>>
        state "Process input" as Processinput

        [*] --> Initial : Startup
        Initial --> Initial : User input
        Initial --> Decision
        Decision --> Processinput : Confirm
        Decision --> [*] : Cancel
        Processinput --> [*] : Set task

```

### Sequencediagram

```mermaid
    sequenceDiagram
    actor User
    participant App
    participant DataBase
    participant Windows

    User ->>+ App : Startup
    App ->>+ DataBase : Query current settings
    DataBase -->>- App : Settings 
    App ->> App : Load settings into GUI

    loop
        User ->> App : Input
    end

    User ->> App : End dialog
    App ->> App : Read out input fields

    alt Window.DialogResult = True
        App ->> DataBase : Write data
        App ->>+ Windows : Query for task existence
        Windows -->>- App : Yes/No

        alt task_exists = True
            App ->>+ Windows : Delete task
            Windows ->>- Windows : Remove task
        end

        App ->>- Windows : Create task
    end

```

```mermaid
    sequenceDiagram
        loop daily
            Windows ->> Task: Start
        end 
```

<br>

## 3. Implementation

---

This program was implemented with Powershell because of its communication capabilites with the Windows operating system. This an essential trait when setting tasks.

Currently the user data is stored in a JSON file, alternatively it could be implemented bz a DataBase like MySQL.

See source code in src subfolder. 

### Requirements

- Dell Display Manager executable
- Powershell
- assemblies: presentationframework, presentation
- Admin rights??

--- 

### TODO

- [] make setting of color temperature available
- [x] make setting of windows theme available
