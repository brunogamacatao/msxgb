#include "dos.h"
#include "msx_printf.h"

// print string
void print_string(const char *s) {
    while (*s) {
        DOS_CharOutput(*s++);
    }
}

// print int (16-bit)
void print_int(int n) {
    if (n < 0) {
        DOS_CharOutput('-');
        n = -n;
    }

    if (n >= 10) {
        print_int(n / 10);
    }

    DOS_CharOutput((n % 10) + '0');
}

void msx_printf(const char *format, ...) {
    char *arg_ptr;

    // 🔥 MAGIC: get pointer to first argument after format
    arg_ptr = (char*)(&format);
    arg_ptr += 2;  // skip format pointer (16-bit)

    while (*format) {
        if (*format == '%') {
            format++;

            switch (*format) {
                case 's': {
                    char *s = *(char**)arg_ptr;
                    arg_ptr += 2;
                    print_string(s);
                    break;
                }

                case 'd': {
                    int n = *(int*)arg_ptr;
                    arg_ptr += 2;
                    print_int(n);
                    break;
                }

                case 'c': {
                    char c = *(char*)arg_ptr;
                    arg_ptr += 2;
                    DOS_CharOutput(c);
                    break;
                }

                case '%': {
                    DOS_CharOutput('%');
                    break;
                }

                default: {
                    DOS_CharOutput('%');
                    DOS_CharOutput(*format);
                }
            }
        } else {
            DOS_CharOutput(*format);
        }

        format++;
    }
}

