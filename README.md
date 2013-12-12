# Remindmeto

A simple command line utility for recurring UI reminders.

Current supported UI elements include libnotify for Ubuntu and Growl for Mac/Windows.

## Installation

    $ gem install remindmeto

## Usage

    $ remindmeto task {in/every} {time} {second(s)/minutes(s)/hour(s)}

Examples:

    $ remindmeto relax every 5 minutes
    $ remindmeto turn over the laundry in an hour

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
