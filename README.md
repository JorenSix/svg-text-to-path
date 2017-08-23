# Text to SVG Path

This set of Ruby scripts transforms a __text into SVG paths__. The aim is to be able to show crisp, scalable text that is readable by humans but not easily readable by machines. An typical example is that you would want to be able to show an e-mail address on a website without it being scraped trivially by spammers. Telephone numbers or other personal data could perhaps benefit from similar treatment. In general thing that you want to show to anonymous users but not easily indexed, searchable or scraped.

The script takes a text and an SVG-font and spits out an SVG file containing the text encoded in SVG-paths (according to the font). The text - and this is crucial - is not wrapped in an SVG `<text>`-tag.

## Example

john.smith@example.com this is plain text

![Email as SVG path](https://0110.be/releases/john.smith.svg) these are SVG paths, try to select or copy parts.

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