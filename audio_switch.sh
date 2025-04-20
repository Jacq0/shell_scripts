#switches output between speaker and headphones on hotkey
PHONES='alsa_output.usb-Razer_Razer_USB_Audio_Controller_000000000000000000000000-00.stereo-chat'
SPEAKERS='alsa_output.pci-0000_09_00.1.hdmi-stereo-extra2'

HOTKEY=$'\x1D' #hotkey opf ctrl+], change to whatever needed
FLAG=true

while true; do
    read -rsn1 key
    if [[ "$key" == "$HOTKEY" ]]; then
        if [[ "$FLAG" == true ]]; then
            pactl set-default-sink "$SPEAKERS"
            FLAG=false
        else
            pactl set-default-sink "$PHONES"
            FLAG=true
        fi
    fi
done
