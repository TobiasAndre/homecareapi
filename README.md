HOMECARE API
===================

This api collect readings from IoT thermostats and report a simple statistics against them.
We assume that the thermostats are connected to the network and they're pushing their data in real time (because they don't have the capacity to buffer them).

Project details:
* Ruby: 2.6.3
* Rails: 5.2.3

This project uses sidekiq for enqueue jobs for database writing.