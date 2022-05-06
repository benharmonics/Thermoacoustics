# Thermoacoustics
Projects having to do with thermoacoustic refrigerators and engines.

## Spring 2022 - Advanced Physics Laboratory

### TAR.jl
General scratch work. Includes sources!

### stack_shape.ipynb
This is the notebook where we use our collected data to compare the mean temperature difference across each stack shape (for the 4-inch stacks).

### Scripts
Scratch Python script for calibrating an Adafruit Microphone with an Arduino. The Adafruit microphone is connected to an Arduino UNO, then by connecting the Arduino to your computer with a USB type B cable, you can read the Arduino's output, which we've calibrated to print the voltage of our microphone to COM3. The data from the Adafruit microphone is saved (via PuTTY, which can connect to COM3 and log the session output) to a file called `microphone.log`, which then has to be cleaned using our Python scripts. Actually, I don't think we ended up using any of this...
