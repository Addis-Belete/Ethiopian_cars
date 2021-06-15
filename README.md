# Ruby on Rials Capstone Project

# Project Name: Ethio-cars

Created a desktop-only app where a user can sign up and/or sign in, select categories, and upload vehicle images with specifications. A user can vote a vehicle interested in and the vehicle that has more votes displayed on the top of the home page. Cloudinary used for storage.

## Screenshots

![Ethio-cars](app/assets/images/ethio_cars3.png)
![Ethio-cars](app/assets/images/ethio_cars1.png)
![Ethio-cars](app/assets/images/ethio_cars2.png)

## Video

[video](https://www.loom.com/share/e7f72b7b7b2240139de6f87493936c83)

## Live Demo

[Ethio-cars](https://quiet-gorge-87738.herokuapp.com/)

## Video
[Video-link](https://www.loom.com/share/836eb2de147a45fe8002b19a97cb2de8)

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.7.2
Rails: 5.2.3
Postgres: >=9.5

### Run locally

1. git clone `git@github.com:Addis0943/Ethiopian_cars.git`

### Image Processor

ImageMagick must be installed and Paperclip must have access to it. To ensure that it does, on your command line, run which convert (one of the ImageMagick utilities). This will give you the path where that utility is installed. For example, it might return /usr/local/bin/convert. So if imagemagic not installed use the following commands to install:

If you're on Mac Os X, you will want to run the following with Hombrew:

```
brew install imagemagick
```

If you are on Ubuntu (or any Debian base Linux distribution), you'll want to run the following with apt-get:

```
sudo apt-get install imagemagick -y
```

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```

## ✒️ Author <a name = "author"></a>

👤 **Addis Belete**

- Github: [@Addis0943](https://github.com/Addis0943)
- Linkedin: [Addid Belete](https://www.linkedin.com/in/addis-belete-134b98191/)
