# Fortran "Just Enough Modules" Library

The kitchen-sink Fortran library that nobody asked for.

## Contents
1. [Installation](##Installation)

## Installation
FJEM is built on the FPM framework. To add FJEM as a dependency in your own FPM project, add this github repository to the dependencies section of your fpm.toml file:
```
[dependencies]
fjem = { git = "https://github.com/WP-Lavery/FJEM" }
```
Alternatively, you can install FJEM for use in non-FPM projects by using FPM install. First, clone this repository:
```
git clone https://github.com/WP-Lavery/FJEM.git
```

Next run the install command in the root of the FJEM repository:
```
fpm install --compiler [COMPILER NAME]
```

By default, the compiled libraries and modules will end up in the ~/.local/lib/ and ~/.local/include/ locations respectively. You may choose to use the --prefix flag to change this. Once installed, you can link to these locations as usual when compiling your Fortran project.
