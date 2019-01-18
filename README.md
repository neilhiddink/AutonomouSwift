# AutonomouSwift
A self-driving RC car written in Swift

## Contributing

In the future, please refer to CONTRIBUTING.md for information and guidelines about contributing to this project. Until that file has been populated, feel free to fork the repository and submit a pull request. Thanks!

❗️**Note: This README is currently a work in progress**

## 🛒 Shopping List 

To follow along with this project yourself, there are several hardware and software items you will need to purchase and/or download. In each of the tables below, I have provided a list of the items I bought with their prices at the time of purchase. These may be different for you depending on where you live.

#### Hardware

| Item            | Price Estimate | Notes |
|:---------------:|:--------------:|:----- |
| [Macbook Pro 15"](https://www.apple.com/shop/buy-mac/macbook-pro/15-inch) | $2700.00 USD | (1) Terminal to access the Raspberry Pi (2) Downloading Raspbian, SD Card Setup, Etcher, and VNC Viewer (3) Xcode to build an app for car controls |
| [Apple USB to USB-C Dongle](https://www.apple.com/shop/product/MJ1M2AM/A/usb-c-to-usb-adapter?afid=p238%7CsScygQXEW-dc_mtid_1870765e38482_pcrid_246386725857_&cid=aos-us-kwgo-pla-btb--slid--product-MJ1M2AM/A) | $19.00 USD | Useful when writing to SD Card with MicroSD reader. |
| [Logitech C920 HD Pro](https://g.co/kgs/RPcDze) | $49.99 USD   | Vision system for the Raspberry Pi |
| [CanaKit Ultimate Starter Kit](https://www.canakit.com/raspberry-pi-3-ultimate-kit.html) | $89.95 USD   | Everything you need to get started with Raspberry Pi 3 |
| [Maisto 2017 Mustang GT](https://www.amazon.com/Maisto-Variable-Control-Vehicle-Colors/dp/B01ARERJJ8) | $45.76 USD   | RC Car that is easy to take apart |
| [Mophie's Power Reserve 1x](http://www.mophie.com/shop/universal-batteries/power-reserve-1X) | $34.95 USD   | A small but powerful external battery source for the Raspberry Pi, need this for autonomy |
| [USB-C Hub](https://www.amazon.com/gp/product/B0761RZ5WJ/ref=ppx_yo_dt_b_asin_title_o00__o00_s00?ie=UTF8&psc=1) | $19.99 USD   | **Only if your Macbook Pro has USB-C ports** |
| [MicroSD Reader](https://www.amazon.com/SanDisk-MobileMate-microSD-Card-Reader/dp/B07G5JV2B5/ref=sr_1_4?s=electronics&ie=UTF8&qid=1547181191&sr=1-4&keywords=micro+sd+reader) | $12.99 USD   | **Only if you did not purchase the full Canakit** |
| [2-ft Ethernet Cable](https://www.amazon.com/dp/B0745FZKG1?ref_=Oct_DotdC_464398_5&pf_rd_p=7843ae6d-2fa5-5cee-bd9c-278d1559f803&pf_rd_s=merchandised-search-4&pf_rd_t=101&pf_rd_i=464398&pf_rd_m=ATVPDKIKX0DER&pf_rd_r=4C591FVYW323AG4DJT7N&pf_rd_r=4C591FVYW323AG4DJT7N&pf_rd_p=7843ae6d-2fa5-5cee-bd9c-278d1559f803) | $5.94 USD | For initially setting up the pi via ethernet |

#### Software

| Item            | Price Estimate | Notes |
|:---------------:|:--------------:|:----- |
| [VNC Viewer](https://www.realvnc.com/en/connect/download/viewer/) | FREE | Remotely access the Rasbian desktop from your Macbook Pro |
| [Raspbian Stretch with desktop](https://www.raspberrypi.org/downloads/raspbian/)| FREE | May take some time to download depending on your internet connection |
| [Etcher](https://www.balena.io/etcher/) | FREE | Use this to install Raspbian on your Raspberry Pi |
| [Xcode 10](https://developer.apple.com/xcode/) | FREE | Required to build iOS apps |
| [Apple Developer Program Membership](https://developer.apple.com/programs/how-it-works/) | $99/year | Required to run iOS apps on an actual device |

[Introduction to the Mac OS X Command Line](https://blog.teamtreehouse.com/introduction-to-the-mac-os-x-command-line)

[https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0](https://hackernoon.com/raspberry-pi-headless-install-462ccabd75d0)

[How to setup Raspberry Pi 3 Headless with Mac](https://medium.com/@anoopm6/how-to-setup-raspberry-pi-3-headless-with-mac-345a9e63d01b)

## 🚘 Getting Started

<p align="center"><img src="https://github.com/neilhiddink/AutonomouSwift/blob/master/Resources/pi-1.jpeg" width="250"></p>

This guide assumes you have already installed your Raspberry Pi in its case and have all of the required hardware and software. If you need more information about basic setup of the Raspberry Pi, a good resource is the official post [Setting up your Raspberry Pi](https://projects.raspberrypi.org/en/projects/raspberry-pi-setting-up/2) on raspberrypi.org.

#### Setting up the SD Card

1. Insert your MicroSD card into the MicroSD reader and then insert the reader into a USB to USB-C dongle so that you can plug it into your Macbook Pro.

2. Open Etcher. Select the **Raspbian Stretch for Desktop** .img file you downloaded from raspberrypi.org and the remote drive for the SD card, then click **Flash**.

3. Open Finder press eject to safely disconnect the SD card from your Macbook Pro. 

4. Insert the SD Card into the Raspberry Pi SD card slot.

#### 🔌 Configuring the Raspberry Pi

5. Plug in your Raspberry Pi. You should see a red LED light up near the power input:

<p align="center"><img src="https://github.com/neilhiddink/AutonomouSwift/blob/master/Resources/pi-2.jpeg" width="250"></p>

6. After a few seconds, a green LED should light up next to the red LED:

<p align="center"><img src="https://github.com/neilhiddink/AutonomouSwift/blob/master/Resources/pi-3.jpeg" width="250"></p>

7. Using your USB-C Hub and an ethernet cable, Connect your Raspberry Pi to your Macbook Pro.

8.

9. 

These instructions will help you set up your Raspberry Pi's wifi and configure the webcam server.

[Build a Raspberry Pi Webcam Server](https://www.youtube.com/watch?v=WNKbZsrsKVs)

[How to Setup OBS Studio for Local Recording and Streaming](https://www.youtube.com/watch?v=JHVdi8hhnLw)

[Mac: How to Stream & Record using OBS on a Mac (Open Broadcaster Software) (Easy)](https://www.youtube.com/watch?v=pAdvuOI6UfU&t=331s)

[Raspberry Pi VNC Screen Sharing on a Mac](https://www.youtube.com/watch?v=2iVK8dn-6x4)

_Coming Soon_

## 💻 Code 

#### Step 1️⃣: Set up the car's vision system - 

[Apple Documentation - AVKit](https://developer.apple.com/documentation/avfoundation/cameras_and_media_capture)

Set up camera on iOS app with AVKit and AVCaptureSession
[CoreML: Real Time Camera Object Detection with Machine Learning - Swift 4](https://www.youtube.com/watch?v=p6GA8ODlnX0)



## 🔮 Future Plans


