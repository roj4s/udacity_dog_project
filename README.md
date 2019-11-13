[//]: # (Image References)

[image1]: ./images/sample_dog_output.png "Sample Output"
[image2]: ./images/vgg16_model.png "VGG-16 Model Keras Layers"
[image3]: ./images/vgg16_model_draw.png "VGG16 Model Figure"


## Project Overview

Udacity's Convolutional Neural Networks (CNN) project in the AI Nanodegree! It
explains how to build a pipeline that can be used within a web or mobile app to
process real-world, user-supplied images.  An algorithm is implemented in which,
given an image of a dog, it identifies an estimate of the canine’s breed.  If supplied an image of a human, the code will identify the resembling dog breed.

![Sample Output][image1]

It explores state-of-the-art CNN models for classification.  It explores the challenges involved in piecing together a series of models designed to perform various tasks in a data processing pipeline.  Each model has its strengths and weaknesses, and engineering a real-world application often involves solving many problems without a perfect answer.  

## Project Instructions

### Instructions

1. Clone the repository and navigate to the downloaded folder.
```	
git clone https://github.com/roj4s/udacity_dog-project.git
cd dog-project
```

2. Download the [dog dataset](https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/dogImages.zip).  Unzip the folder and place it in the repo, at location `path/to/dog-project/dogImages`.

3. Download the [human dataset](https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/lfw.zip).  Unzip the folder and place it in the repo, at location `path/to/dog-project/lfw`.  If you are using a Windows machine, you are encouraged to use [7zip](http://www.7-zip.org/) to extract the folder. 

4. Download the [VGG-16 bottleneck features](https://s3-us-west-1.amazonaws.com/udacity-aind/dog-project/DogVGG16Data.npz) for the dog dataset.  Place it in the repo, at location `path/to/dog-project/bottleneck_features`.

5. Build docker image using the Dockerfile provided. Or pull from docker hub as `docker pull roj4s/udacity_dog_project`

6. Run the built image with `docker run [image_name] --gpus --all -v [path-to-dogs-dataset]:/opt/dog_project/dogImages -v [path-to-humans-dataset]:/opt/dog_project/lfw -v [path-to-project]/.ipynb_checkpoints:/opt/dog_project/.ipynb_checkpoints -v [path-to-project]/saved_models:/opt/dog_project/saved_models -v [path-to-project]/bottleneck_features:/opt/dog_project/bottleneck_features [image-name]`
