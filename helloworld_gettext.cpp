#include <iostream>
#include <libintl.h>
#include <locale.h>

int main(int argc, char *argv[]) {
    setlocale(LC_ALL, "");
    bindtextdomain("helloworld", ".");
    textdomain("helloworld");
    std::cout << gettext("Hello World!") << std::endl;
}