# lecture
Latex template to use for seminar, lecture, course or workshops. Mainly for
students. It is inspired by http://www.minet.uni-jena.de.

The central tex file is main.tex. To build that you could call simply make(with
setup) or make pdf(without setup). Optional you could set a variable
SOURCE=my.tex to use a other file (e.g. a link) to use an other name/file.

Example

        SOURCE=your.tex make pdf
