## PHP Testing Tools

```sh
docker pull luisgros/phptools
docker run -v $(pwd):/src luisgros/phptools phpcs /path/to/php/file(s) --standard=psr2
docker run -v $(pwd):/src luisgros/phptools phpmd /path/to/files
docker run -v $(pwd):/src luisgros/phptools phploc /dir
```

[PHP Code_Sniffer](https://github.com/squizlabs/PHP_CodeSniffer)

`
PHP_CodeSniffer is a set of two PHP scripts; the main phpcs script that tokenizes PHP, JavaScript and CSS files to detect violations of a defined coding standard, and a second phpcbf script to automatically correct coding standard violations.
`

[PHP Mess Detector](https://github.com/phpmd/phpmd)

`
PHPMD is a spin-off project of PHP Depend and aims to be a PHP equivalent of the well known Java tool PMD. PHPMD can be seen as an user friendly frontend application for the raw metrics stream measured by PHP Depend.
`

[PHP Copy/Paste Detector](https://github.com/sebastianbergmann/phpcpd)

`
phpcpd is a Copy/Paste Detector (CPD) for PHP code.
`

[PHP loc](https://github.com/sebastianbergmann/phploc)

`
phploc is a tool for quickly measuring the size and analyzing the structure of a PHP project.
`

[PHP Unit](https://github.com/sebastianbergmann/phpunit)

`
PHPUnit is a programmer-oriented testing framework for PHP. It is an instance of the xUnit architecture for unit testing frameworks.
`
