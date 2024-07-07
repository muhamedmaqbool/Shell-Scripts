#!/bin/bash
read -p "enter any number or alphabet or anything you want:" num
case $num in 
                  [1-9])
                        echo "you entered a Single number"
                        ;;
                  [A-Z]) 
                        echo "your entered a Alphabetic number"
                        ;;
                  [a-z])
                        echo "you entered a Small letter"
                        ;;
                      *)
                        echo "you entered an invalid option"
                        ;;
esac

                   
