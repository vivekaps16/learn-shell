# Print some message on the screen we use echo or printf command.
# echo is simple approach nd widely used, we will learn it .

# echo Input

echo Hello World

# print colors
# syntax: echo -e "\e[COLmHello World\e[0m"
# echo -e, -e - enable colors
# \e[COLm - Tell which color
# \e[0m - Disable color

# COL       - CODE
# RED       - 31
# GREEN     - 32
# YELLOW    - 33
# BLUE      - 34
# MAGENTA   - 35
# CYAN      - 36

echo -e "\e[31mHello World in Red Color\e[0m"
echo -e "\e[32mHello World in Green Color\e[0m"
echo -e "\e[33mHello World in Yellow Color\e[0m"
echo -e "\e[34mHello World in Blue Color\e[0m"
echo -e "\e[35mHello World in Magenta Color\e[0m"
echo -e "\e[36mHello World in Cyan Color\e[0m"

# We can print new lines by using \n
echo -e "Hello\nWorld"