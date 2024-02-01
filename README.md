# configbot

This repo starts out with a basic confluent [cp-all-in-one](https://github.com/confluentinc/cp-all-in-one/tree/7.5.0-post/cp-all-in-one) kafka dockercompose.yal file.

The real "magic" (if it can be called that) is the configbot image. This is a customized image built off a base confluent image with all the confluent tools installed. The idea behind this is when you `docker-compose up` that the configbot knows how to wait for all the kafka bits to be up and running and then it can bootstrap your system by creating the topics, the connectors, sinking or seeding data, etc. This just makes it easier on developers by providing a small framework to automate having the full kafka experience on your workstation.
