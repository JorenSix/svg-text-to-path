# Text to SVG Path

This set of Ruby scripts transforms a __text into SVG paths__. The aim is to be able to show crisp, scalable text that is readable by humans but not easily readable by machines. An typical example is that you would want to be able to show an e-mail address on a website without it being scraped trivially by spammers. Telephone numbers or other personal data could perhaps benefit from similar treatment. In general thing that you want to show to anonymous users but not easily indexed, searchable or scraped.

The script takes a text and an SVG-font and spits out an SVG file containing the text encoded in SVG-paths (according to the font). The text - and this is crucial - is not wrapped in an SVG `<text>`-tag.

## Example

john.smith@example.com this is plain text

<svg version="1.1" baseProfile="full" height="16.5" width="158" xmlns="http://www.w3.org/2000/svg"> <g fill="black" transform="translate(0, 14) scale(0.014)"><path  transform="translate(0) scale(1, -1)" d="M88 524h83v-633q0 -109 -143 -109q-13 0 -28 3v71q12 -2 23 -2q36 0 50.5 15.5t14.5 54.5v600zM171 729v-105h-83v105h83z" />
<path  transform="translate(243.0) scale(1, -1)" d="M266 539q113 0 175.5 -74.5t62.5 -210.5q0 -129 -63.5 -203t-173.5 -74q-112 0 -174.5 74.5t-62.5 206.5t63 206.5t173 74.5zM267 462q-70 0 -110 -54.5t-40 -149.5t40 -149.5t110 -54.5q69 0 109.5 54.5t40.5 146.5q0 97 -39.5 152t-110.5 55z" />
<path  transform="translate(777.0) scale(1, -1)" d="M393 363q0 55 -33.5 79t-74.5 24q-64 0 -103 -48.5t-39 -128.5v-289h-83v729h83v-277q37 48 74.5 67.5t93.5 19.5q76 0 120.5 -38.5t44.5 -104.5v-396h-83v363z" />
<path  transform="translate(1313.0) scale(1, -1)" d="M60 524h77v-88q35 55 75.5 79t98.5 24q76 0 121 -39t45 -104v-396h-83v363q0 47 -29 75t-79 28q-64 0 -103 -48.5t-39 -128.5v-289h-84v524z" />
<path  transform="translate(1850.0) scale(1, -1)" d="M184 104v-104h-104v104h104z" />
<path  transform="translate(2100.0) scale(1, -1)" d="M122 156q6 -47 32.5 -74.5t95.5 -27.5q55 0 88.5 22.5t33.5 59.5q0 29 -19 46t-62 27l-78 19q-93 22 -129.5 55.5t-36.5 95.5q0 73 55 116.5t146 43.5t140 -42t50 -119h-88q-3 84 -105 84q-51 0 -81 -21.5t-30 -57.5q0 -28 23 -45.5t74 -29.5l80 -19q78 -19 113 -53.5 t35 -92.5q0 -76 -58.5 -121t-157.5 -45q-203 0 -209 179h88z" />
<path  transform="translate(2593.0) scale(1, -1)" d="M60 524h77v-74q34 47 71.5 68t89.5 21q97 0 141 -80q37 44 73 62t88 18q73 0 112.5 -37.5t39.5 -108.5v-393h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v524z" />
<path  transform="translate(3405.0) scale(1, -1)" d="M150 524v-524h-83v524h83zM150 729v-105h-84v105h84z" />
<path  transform="translate(3627.0) scale(1, -1)" d="M260 524v-68h-86v-359q0 -28 9.5 -37.5t36.5 -9.5q25 0 40 4v-70q-39 -7 -68 -7q-49 0 -75 21.5t-26 61.5v396h-71v68h71v144h83v-144h86z" />
<path  transform="translate(3907.0) scale(1, -1)" d="M393 363q0 55 -33.5 79t-74.5 24q-64 0 -103 -48.5t-39 -128.5v-289h-83v729h83v-277q37 48 74.5 67.5t93.5 19.5q76 0 120.5 -38.5t44.5 -104.5v-396h-83v363z" />
<path  transform="translate(4443.0) scale(1, -1)" d="M665 501h83l-90 -280q-12 -35 -12 -50q0 -18 15 -31t35 -13q64 0 116 71t52 159q0 125 -104.5 216t-247.5 91q-158 0 -275.5 -117t-117.5 -274q0 -143 108 -240.5t267 -97.5q79 0 193 32l28 -67q-112 -42 -226 -42q-124 0 -229 53.5t-165.5 145.5t-60.5 201 q0 128 66.5 239.5t180 177.5t244.5 66q175 0 300.5 -110t125.5 -262q0 -122 -73 -217t-199 -95q-96 0 -110 77q-66 -72 -142 -72q-70 0 -116.5 52.5t-46.5 130.5q0 109 78 193t179 84q84 0 122 -87zM453 126q65 0 110.5 83t45.5 159q0 38 -27 64t-67 26q-63 0 -112 -65 t-49 -149q0 -49 29 -83.5t70 -34.5z" />
<path  transform="translate(5458.0) scale(1, -1)" d="M503 234h-386q2 -82 42.5 -131t111.5 -49q102 0 137 105h84q-16 -86 -75 -134t-149 -48q-110 0 -174 74.5t-64 203.5t65.5 206.5t174.5 77.5q233 0 233 -305zM119 302h295q0 68 -41 114t-104 46t-104 -43.5t-46 -116.5z" />
<path  transform="translate(5991.0) scale(1, -1)" d="M285 271l181 -271h-97l-131 201l-133 -201h-95l185 267l-175 257h95l126 -190l126 190h94z" />
<path  transform="translate(6467.0) scale(1, -1)" d="M53 369q6 170 210 170q97 0 147 -36.5t50 -106.5v-308q0 -41 45 -41q9 0 18 2v-63q-35 -9 -57 -9q-40 0 -60.5 18.5t-25.5 58.5q-84 -77 -178 -77q-79 0 -125.5 42t-46.5 113q0 23 4.5 42t10 33.5t19.5 27t23.5 20.5t32 15.5t34.5 11t42 8.5t44 7t50 7q49 6 68 19t19 39 v22q0 38 -30.5 58t-86.5 20q-58 0 -88 -22.5t-35 -70.5h-84zM220 50q69 0 113 36.5t44 78.5v94q-25 -12 -75.5 -20t-87.5 -14t-67 -28.5t-30 -62.5t27 -62t76 -22z" />
<path  transform="translate(7010.0) scale(1, -1)" d="M60 524h77v-74q34 47 71.5 68t89.5 21q97 0 141 -80q37 44 73 62t88 18q73 0 112.5 -37.5t39.5 -108.5v-393h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v524z" />
<path  transform="translate(7822.0) scale(1, -1)" d="M60 -218v742h77v-79q59 94 167 94q104 0 164.5 -77t60.5 -209q0 -125 -61.5 -200.5t-162.5 -75.5q-97 0 -161 78v-273h-84zM290 461q-66 0 -106 -55.5t-40 -147.5t40 -147.5t106 -55.5q68 0 110 55.5t42 144.5q0 94 -41.5 150t-110.5 56z" />
<path  transform="translate(8381.0) scale(1, -1)" d="M144 729v-729h-84v729h84z" />
<path  transform="translate(8595.0) scale(1, -1)" d="M503 234h-386q2 -82 42.5 -131t111.5 -49q102 0 137 105h84q-16 -86 -75 -134t-149 -48q-110 0 -174 74.5t-64 203.5t65.5 206.5t174.5 77.5q233 0 233 -305zM119 302h295q0 68 -41 114t-104 46t-104 -43.5t-46 -116.5z" />
<path  transform="translate(9128.0) scale(1, -1)" d="M184 104v-104h-104v104h104z" />
<path  transform="translate(9378.0) scale(1, -1)" d="M470 348h-84q-8 55 -40 84.5t-84 29.5q-68 0 -106.5 -55.5t-38.5 -153.5q0 -93 39 -146t108 -53q107 0 128 126h84q-8 -96 -64 -149.5t-150 -53.5q-107 0 -169.5 74.5t-62.5 201.5q0 130 63.5 208t169.5 78q91 0 145.5 -49t61.5 -142z" />
<path  transform="translate(9884.0) scale(1, -1)" d="M266 539q113 0 175.5 -74.5t62.5 -210.5q0 -129 -63.5 -203t-173.5 -74q-112 0 -174.5 74.5t-62.5 206.5t63 206.5t173 74.5zM267 462q-70 0 -110 -54.5t-40 -149.5t40 -149.5t110 -54.5q69 0 109.5 54.5t40.5 146.5q0 97 -39.5 152t-110.5 55z" />
<path  transform="translate(10418.0) scale(1, -1)" d="M60 524h77v-74q34 47 71.5 68t89.5 21q97 0 141 -80q37 44 73 62t88 18q73 0 112.5 -37.5t39.5 -108.5v-393h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v361q0 50 -25.5 77.5t-71.5 27.5q-51 0 -87 -40t-36 -97v-329h-84v524z" /></g>
</svg> these are SVG paths, try to select or copy parts.

Each letter is converted to an SVG path corresponding to the SVG Font . An SVG path looks something like this:

`<path  transform="translate(0) scale(1, -1)" d="M88 5-143 ... 729v-105h-83v105h83z" />`


## Features and limitations

An alternative solution is to render PNG files with text. SVG paths -being vector based - are salable and blend in more easily with the rest of a web page. CSS colors are - for example - supported. Fonts can also be matched (see below to convert TTF to SVG).

If many SVG files need to be loaded on one page it could be beneficial to 
*inline* the SVG. This is easier done with SVG than with PNG.

Generating many SVG files is fast. Once the font file is loaded only a couple of lookups and string concatenations are needed. Creating raster based PNG's is slower.

Accessibility is a problem. Screen readers will not manage to read the text. Remember it is designed to hinder scraping. PNG's have the same problem. 

The size of the rendered SVG is rather large it quickly amounts to several kilobytes. As SVG is a text based format GZIP compressing the SVG during transport by a HTTP server reduces the size significantly. SVGZ or gzipped SVG could also be an option. SVGZ is similar in size as a PNG.


## Converting a TTF font to an SVG font

To convert a TTF font to an SVG font for use in this library there are web-based converters. One of those able to [convert TTF to SVG font is cloudconvert.com](https://cloudconvert.com/).

## Installing and testing

This is a simple set of ruby scripts currently no attention is given to packaging. The only dependency is the nokogiri gem

0. Install nokogiri: `gem install nokogiri`
0. Clone the repo: `git clone https://github.com/JorenSix/svg-text-to-path.git`
0. `ruby "john.smith@example.com" fonts/FreeSans.svg > out.svg`
0. Verify `out.svg` in your favorite browser or SVG viewer.

## Credits

This is a fork of code developed by [caesarsol](https://github.com/caesarsol) who developed the bulk of the code with a different focus.