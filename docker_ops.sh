#!/bin/bash

# save the image 
docker save -o pharmer.img.tar pharmer


# load the image
docker load -i pharmer.img.tar

