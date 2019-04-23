#!/bin/bash
cmd=(dialog --separate-output --checklist "Select options:" 22 76 16)
options=(1 "inception3" on    # any option can be set to default to "on"
         2 "resnet50" on
         3 "alexnet" on
         4 "vgg16" on)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
    case $choice in
        1)
            python tf_cnn_benchmarks.py --num_gpus=1 --model inception3 --batch_size 32 --allow_growth=1 > inception3.txt
            ;;
        2)
            python tf_cnn_benchmarks.py --num_gpus=1 --model resnet50 --batch_size 32 --allow_growth=1 > resnet50.txt
            ;;
        3)
            python tf_cnn_benchmarks.py --num_gpus=1 --model alexnet --batch_size 32 --allow_growth=1 > alexnet.txt
            ;;
        4)
            python tf_cnn_benchmarks.py --num_gpus=1 --model vgg16 --batch_size 32 --allow_growth=1 > vgg16.txt
            ;;
    esac

done

echo "----------------Finished----------------"
echo "inception3"
tail -n 2 inception3.txt
echo "resnet50"
tail -n 2 resnet50.txt
echo "alexnet"
tail -n 2 alexnet.txt
echo "vgg16"
tail -n 2 vgg16.txt
