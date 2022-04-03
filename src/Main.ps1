# get params via graphical ui

# 

# Anforderungen
# - tickbox to align with local sun setting/rising time
# - set time
# - unset time
# - brightness day
# - brightness night
# - colortemp day
# - colortemp night
# 
# 


# GUI was created at https://poshgui.com/

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = @"
    <Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Width="655" Height="529" HorizontalAlignment="Left" VerticalAlignment="Top" Margin="0,0,0,0">
        <StackPanel Orientation="Horizontal" Margin="10,10,10,10">
            <StackPanel HorizontalAlignment="Left" VerticalAlignment="Top" Margin="0,10,0,0">
                <CheckBox HorizontalAlignment="Left" VerticalAlignment="Top">
                <TextBlock>
                    Adjust set times 
                    <LineBreak/>
                    to local sun rise/set.
                </TextBlock>
                </CheckBox>
                <Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Set Times" Margin="0,10,0,0"/>
                <Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Brightness" Margin="0,10,0,0"/>
                <Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Colour temp" Margin="0,10,0,0"/>
            </StackPanel>
            
            <StackPanel HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10, 10, 10, 10">
                <Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Day" Margin="0,0,0,0"/>
                <TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="120" TextWrapping="Wrap" Margin="0, 10, 0, 0"/>
                <TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="120" TextWrapping="Wrap" Margin="0, 10, 0, 0"/>
                <ComboBox HorizontalAlignment="Left" VerticalAlignment="Top" Width="120" Margin="0, 10, 0, 0">
                    <ComboBoxItem>
                        Warm
                    </ComboBoxItem>
                    <ComboBoxItem IsSelected="True">
                        Cool
                    </ComboBoxItem>
                </ComboBox>
            </StackPanel>

            <StackPanel HorizontalAlignment="Left" VerticalAlignment="Top" Margin="10,10,10,10">
                <Label HorizontalAlignment="Left" VerticalAlignment="Top" Content="Night"/>
                <TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="120" TextWrapping="Wrap" Margin="0, 10, 0, 0"/>
                <TextBox HorizontalAlignment="Left" VerticalAlignment="Top" Height="32" Width="120" TextWrapping="Wrap" Margin="0, 10, 0, 0"/>
                <ComboBox HorizontalAlignment="Left" VerticalAlignment="Top" Width="120" Margin="0, 10, 0, 0">
                    <ComboBoxItem IsSelected="True">
                        Warm
                    </ComboBoxItem>
                    <ComboBoxItem>
                        Cool
                    </ComboBoxItem>
                </ComboBox>
            </StackPanel>
        </StackPanel>
    </Window>
"@


$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }



$Window.ShowDialog()
