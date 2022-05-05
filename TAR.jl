### A Pluto.jl notebook ###
# v0.19.0

using Markdown
using InteractiveUtils

# ╔═╡ 1791640c-695c-4798-91f3-d82b6884a2e7
md"# Thermoacoustic Refrigerator"

# ╔═╡ 99e434f4-67a0-4ed9-af28-75759a3a28ed
md"**April 1 2022**: Signifon 5, Ben Jiron

All the parts are in except for the PCV coupler! I'm going to be in a lot next week to actually build the device; it's just about ready to go. We also need to print the stand for the resonator tube, but other than that, we should be able to put things together and do a proof-of-concept trial before we add in the aluminum heat exchanges (which will require us to cut a hole in the resonator, so it's good that the TAR should still work with less efficiency even before we make permanent changes to the tube)

This week, I worked on trying to calculate the theoretical efficiency of the apparatus, following the calculations done in *Maximum cooling and maximum efficiency of thermoacoustic refrigerators* by L.K. Tartibu (see **Sources** section). I had to gather a bit of info about the stack; the calculation itself is pretty complex. The only thing I really have left with it is to confirm that the 'mean pressure' variable should just be roughly atmospheric pressure; also, there's a corresponding variable 'dynamic pressure' that I need to know, and I'm not entirely sure what it is. Besides that, I've gathered all the other info for the calculation."

# ╔═╡ 68e32302-71f5-4833-9d9a-e7260b0cff34
md"## Fundamental frequency & the speed of sound"

# ╔═╡ ed0a1cc0-99af-4e8f-a4e1-5fd297b9944b
md"**Helper formulas**"

# ╔═╡ c76e8399-b799-453a-a76c-177ca76b24d7
md"[Convert our temperatures](https://www.srhartley.com/fahrenheit-to-kelvin/formula/)"

# ╔═╡ 02cb640e-d62d-4e71-9768-b6013ffd00d1
fahrenheit_to_kelvin(T) = (T - 32) / 1.8 + 273.15

# ╔═╡ fc1a6ec1-a96a-4727-9d77-5339990aae20
md"Calculate the [speed of sound](https://www.weather.gov/media/epz/wxcalc/speedOfSound.pdf) in knots"

# ╔═╡ f8caf2cb-978a-4d00-b63f-8a5a06fa7e19
vₖ(T) = 643.855 * √(T / 273.15) 	# knots

# ╔═╡ 6e77091a-1d4b-4e29-83da-985e301e3b39
md"Convert [knots to m/s](https://www.weather.gov/media/epz/wxcalc/windConversion.pdf)"

# ╔═╡ 220d75c6-968c-4cfa-baa7-9ae326caaab6
knots_to_ms(vₖ) = 0.5144444vₖ 		# m/s

# ╔═╡ 8bdd9807-8dbf-4ef0-8e62-e3d796e3af7d
md"We'll also need to convert feet to meters later"

# ╔═╡ 3bf40e1a-491c-4c4a-a64e-a30cbd793d1c
feet_to_meters(ft) = 0.3048ft

# ╔═╡ 0121bad4-091c-471a-b524-9b2539579bdb
md"Our velocity vₛ (m/s) as a function of temperature T (Fahrenheit) is"

# ╔═╡ 61ae859c-c601-4438-8a9a-464964d36161
vₛ(T) = fahrenheit_to_kelvin(T) |> vₖ |> knots_to_ms

# ╔═╡ 9299cc29-c494-4971-94c0-1464e17f394a
md"## Calculations

Length of our tube"

# ╔═╡ ab78b0e1-b455-48a5-ac54-ae2f4b335de1
L_ft = (50.75 - 5 / 2.54) / 12 	# ft

# ╔═╡ 3c27ae54-4712-4212-ad56-d2cd18b4a8db
md"which, in meters, is"

# ╔═╡ c06d5843-c9a5-4cd4-8cc3-ce3b975fd83f
L = feet_to_meters(L_ft) 	# m

# ╔═╡ 2cbd3662-ce50-442d-9efa-e481a89ce6a3
md"The ideal stack placement is calculaed to be"

# ╔═╡ 16f82589-78b8-4f50-a783-df2416a5e63c
xₛ = 100L / 4 	# cm

# ╔═╡ 63de7f76-1049-411e-99ad-675c32557011
md"Which means the edge of our stack needs to be at"

# ╔═╡ f99db92a-7c0d-4fd2-a454-6a1d085975c0
xₛ - 2 * 2.54 	# cm

# ╔═╡ 200e7859-286f-4ae7-8edc-8ffa1c545ded
md"The wavelength of our fundamental frequency is"

# ╔═╡ f612ac18-650e-47ad-bb42-ea17601e393f
λ = 2L 			# m

# ╔═╡ 16a4e50a-4692-43da-85e4-bf59d2162c72
let L = feet_to_meters(50 / 12) * 100
	pluglength = 5
	xₛ = (L - pluglength) / 4
	s = xₛ - 10/2
	dist = s + 5
	a = vₛ(71.4)
	λ = 2*(L - pluglength) / 100
	f = a / λ
	"dist = $dist, f = $f"
end

# ╔═╡ 3cdb64d3-e3bb-4c46-ae46-c92ec2838411
md"Speed of sound in air (estimate):"

# ╔═╡ c7cba5dc-98d1-11ec-20dd-8dc2cc8c8ce0
a = vₛ(72.7) 	# m/s

# ╔═╡ 6f38a502-1f59-468c-95ae-174aac1c97fa
md"We end up with a fundamental frequency right around an A₃ (220 Hz)"

# ╔═╡ 3042cfc9-0bf6-450f-9027-f4caa3abf2f6
f = a / λ 		# Hz

# ╔═╡ 7cc7ca00-d053-43b7-b8fd-54b760a81644
md"## Stack Properties

Each stack must have an inner diameter of 3.25 inches and is made of PLA.

**Stack 1**: March 31 2022

- Circumscribed hexagon - Diameter of 5mm

- Wall thickness - 1mm

- 4 inches long

- 0.2084 kg mass"

# ╔═╡ 800c47fb-71f9-4f74-a248-6d8f3054cd02
radius = (3.25 / 2) * 2.54  * 10	# millimeters

# ╔═╡ 69cba1ba-bd00-4315-a565-b9b794824a88
density = .2084 / (π * (4.1275e-2)^2 * (4 * 2.54)*1e-2) # kg/m³

# ╔═╡ d084591f-9471-4991-a785-b92828df25e9
md"A weird one: the thermal penetration depth `δₖ`"

# ╔═╡ 14d5a6cb-cf06-43d9-9a11-e6a211b02d34
let k = .13, Vₘ = 57.2, Cₚ = 99, ω = 2π * f
	δₖ = √(2k * Vₘ / (ω * Cₚ) * 1e3) 	# m?
end

# ╔═╡ 453ccc0f-9272-458f-9bd4-683d397a14ca
md"Note that $1 atm=1.01325e5 Pa$"

# ╔═╡ e2636b4c-ada7-413e-b9d6-8d13fc9151a1
Base.@kwdef struct Vars
	# note that a and f come from calculations above; δₖ comes from f 
	a = 343.79 			# Speed of sound in air
	f = 137.5 			# Frequency (Hz)
	# PLA stack properties (see 'Stack Properties' above)
	δₖ = .411			# Gas thermal penetration depth (mm)
	k = .13 			# Thermal conductivity (W / mK)
	l = .5				# Plate half thickness (mm)
	Lₛ = 40 * 2.54 		# Stack length (mm)
	Xₛ = 304.8			# Stack center position (mm)
	y₀ = 2.5 			# Plate half-gap (mm)
	Tₘ = 70 			# Mean temperature
	# Gas (air) properties
	pₘ = 1.01325e5 		# Mean pressure (Pa)
	γ = 1.4 			# Isentropic coefficient
	ρₘ = 383.248		# Density (kg/m³)
	σ = 0.71 			# Prandtl number (~.71 for air)
	ΔTₘ = 20 			# Temperature span (K)
end

# ╔═╡ 64de83ff-e428-4018-988f-df10040f2cae
struct NormalizedVars
	Lₛₙ
	ΔTₘₙ
	Xₛₙ
	δₖₙ
end

# ╔═╡ 5bdc9d57-9314-4c56-aeba-1efa1b7ca838
function normalizedvars(v::Vars)
	Lₛₙ = (2π * v.f / v.a) * v.Lₛ
	ΔTₘₙ = v.ΔTₘ / v.Tₘ
	Xₛₙ = (2π * v.f / v.a) * v.Xₛ
	δₖₙ = v.δₖ / v.y₀

	NormalizedVars(Lₛₙ, ΔTₘₙ, Xₛₙ, δₖₙ)
end

# ╔═╡ a1be5e60-d637-4571-adfe-4eff1b69319b
md"## Maximum cooling and maximum efficiency

*NOTES*:

$DR=p₀/pₘ$

where $p₀$ is dynamic pressure, $pₘ$ is mean pressure

$BR=y₀/(y₀+l)$

where BR is the *blockage ratio*, or the *porosity*."

# ╔═╡ d6479901-6d3a-4bae-ba8f-cc3f43692c10
md"# Sources

[PLA Material Data Sheet](https://www.sd3d.com/wp-content/uploads/2017/06/MaterialTDS-PLA_01.pdf)

[Polymer Database (PLA Data)](https://polymerdatabase.com/polymers/polylacticacid.html)

[Isentropic Coefficient of Air](https://www.powderprocess.net/Tools_html/Data_Diagrams/Tools_isentropic_coefficients.html)

[Maximum cooling and maximum efficiency of thermoacoustic refrigerators](https://link.springer.com/article/10.1007/s00231-015-1599-y)

[Convert sound pressure in Decibels to Pascals/atm](https://www.translatorscafe.com/unit-converter/en-US/sound-pressure-level/2-9/pascal-sound%20pressure%20level%20in%20decibels/)"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╟─1791640c-695c-4798-91f3-d82b6884a2e7
# ╟─99e434f4-67a0-4ed9-af28-75759a3a28ed
# ╟─68e32302-71f5-4833-9d9a-e7260b0cff34
# ╟─ed0a1cc0-99af-4e8f-a4e1-5fd297b9944b
# ╟─c76e8399-b799-453a-a76c-177ca76b24d7
# ╠═02cb640e-d62d-4e71-9768-b6013ffd00d1
# ╟─fc1a6ec1-a96a-4727-9d77-5339990aae20
# ╠═f8caf2cb-978a-4d00-b63f-8a5a06fa7e19
# ╟─6e77091a-1d4b-4e29-83da-985e301e3b39
# ╠═220d75c6-968c-4cfa-baa7-9ae326caaab6
# ╟─8bdd9807-8dbf-4ef0-8e62-e3d796e3af7d
# ╠═3bf40e1a-491c-4c4a-a64e-a30cbd793d1c
# ╟─0121bad4-091c-471a-b524-9b2539579bdb
# ╠═61ae859c-c601-4438-8a9a-464964d36161
# ╟─9299cc29-c494-4971-94c0-1464e17f394a
# ╠═ab78b0e1-b455-48a5-ac54-ae2f4b335de1
# ╟─3c27ae54-4712-4212-ad56-d2cd18b4a8db
# ╠═c06d5843-c9a5-4cd4-8cc3-ce3b975fd83f
# ╟─2cbd3662-ce50-442d-9efa-e481a89ce6a3
# ╠═16f82589-78b8-4f50-a783-df2416a5e63c
# ╟─63de7f76-1049-411e-99ad-675c32557011
# ╠═f99db92a-7c0d-4fd2-a454-6a1d085975c0
# ╟─200e7859-286f-4ae7-8edc-8ffa1c545ded
# ╠═f612ac18-650e-47ad-bb42-ea17601e393f
# ╠═16a4e50a-4692-43da-85e4-bf59d2162c72
# ╟─3cdb64d3-e3bb-4c46-ae46-c92ec2838411
# ╠═c7cba5dc-98d1-11ec-20dd-8dc2cc8c8ce0
# ╟─6f38a502-1f59-468c-95ae-174aac1c97fa
# ╠═3042cfc9-0bf6-450f-9027-f4caa3abf2f6
# ╟─7cc7ca00-d053-43b7-b8fd-54b760a81644
# ╠═800c47fb-71f9-4f74-a248-6d8f3054cd02
# ╠═69cba1ba-bd00-4315-a565-b9b794824a88
# ╟─d084591f-9471-4991-a785-b92828df25e9
# ╠═14d5a6cb-cf06-43d9-9a11-e6a211b02d34
# ╟─453ccc0f-9272-458f-9bd4-683d397a14ca
# ╠═e2636b4c-ada7-413e-b9d6-8d13fc9151a1
# ╠═64de83ff-e428-4018-988f-df10040f2cae
# ╠═5bdc9d57-9314-4c56-aeba-1efa1b7ca838
# ╟─a1be5e60-d637-4571-adfe-4eff1b69319b
# ╟─d6479901-6d3a-4bae-ba8f-cc3f43692c10
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
