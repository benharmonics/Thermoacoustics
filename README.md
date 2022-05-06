# Thermoacoustics
Projects having to do with thermoacoustic refrigerators and engines.

## Spring 2022 - Advanced Physics Laboratory

### TAR.jl
General scratch work. Includes sources!

### stack_shape.ipynb
This is the notebook where we use our collected data to compare the mean temperature difference across each stack shape (for the 4-inch stacks).

### Scripts
Scratch Python script for calibrating an Adafruit Microphone with an Arduino. The Adafruit microphone is connected to an Arduino UNO, then by connecting the Arduino to your computer with a USB type B cable, you can read the Arduino's output, which we've calibrated to print the voltage of our microphone to COM3. The data from the Adafruit microphone is saved (via PuTTY, which can connect to COM3 and log the session output) to a file called `microphone.log`, which then has to be cleaned using our Python scripts. Actually, I don't think we ended up using any of this...

## Sources

[Thermoacoustic prime movers and refrigerators: Thermally powered engines without moving components](https://trc.nist.gov/cryogenics/Papers/Review/2015-Thermoacoustic_Prime_Movers_and_Refrigerators.pdf), Tao Jin, Jiale Huang, Ye Feng, Rui Yang, Ke Tang, Ray Radebaugh

[Maximum cooling and maximum efficiency of thermoacoustic refrigerators](https://link.springer.com/article/10.1007/s00231-015-1599-y), L.K Tartibu

[PLA Material Data Sheet](https://www.sd3d.com/wp-content/uploads/2017/06/MaterialTDS-PLA_01.pdf)

[Polymer Database (PLA Data)](https://polymerdatabase.com/polymers/polylacticacid.html)

[Isentropic Coefficient of Air](https://www.powderprocess.net/Tools_html/Data_Diagrams/Tools_isentropic_coefficients.html)

[Convert sound pressure in Decibels to Pascals/atm](https://www.translatorscafe.com/unit-converter/en-US/sound-pressure-level/2-9/pascal-sound%20pressure%20level%20in%20decibels/)
