# Overview

This project is about creating a dummy systemd service that prints a message to the console. The project is part of the DevOps track on [roadmap.sh](https://roadmap.sh).

## Requirements

- Create a script called `dummy.sh` that keeps running forever and writes a message to the log file every 10 seconds simulating an application running in the background.
- Create a systemd service `dummy.service` that should start the app automatically on boot and keep it running in the background. If the service fails for any reason, it should automatically restart.
- The following commands should be available for the service:
  - `sudo systemctl start dummy`
  - `sudo systemctl stop dummy`
  - `sudo systemctl enable dummy`
  - `sudo systemctl disable dummy`
  - `sudo systemctl status dummy`
  - `journalctl -u dummy`

## Systemd Service Details

Below is a copy of the systemd service file `dummy.service`, with each component explained in detail:

```ini

[Unit]
Description=Dummy Systemd Service
After=network.target

[Service]
ExecStart=/usr/bin/dummy/dummy.sh
StandardOutput=journal
StandardError=journal
Restart=always
RestartSec=10
User=root
SyslogIdentifier=dummy-service

[Install]
WantedBy=multi-user.target

```

### Unit Section

- **Description**: A human-readable description of the service.
- **After**: Defines the order in which units are started. In this case, the service starts after the network is up.

### Service Section

- **ExecStart**: The command to start the service. In this case, it runs the `dummy.sh` script located at `/usr/bin/dummy/dummy.sh`.
- **StandardOutput**: Where to send the standard output of the service. In this case, it sends it to the journal.
- **StandardError**: Where to send the standard error output of the service. It also sends it to the journal here.
- **Restart**: Defines the restart policy for the service. In this case, it will always restart if it fails.
- **RestartSec**: The time to sleep before restarting the service.
- **User**: The user to run the service as. In this case, it runs as root. It uses the `root` user in this case to ensure it has the necessary permissions to write to the log file. Additionally, because the service requires root privileges, the service file must be placed in the `/etc/systemd/system/` directory. ([Ref](https://linuxhandbook.com/create-systemd-services/))
- **SyslogIdentifier**: The identifier used in the log messages.

### Install Section

- **WantedBy**: The target that the service should be started with. In this case, it is `multi-user.target`. This means the service will start when the system is in multi-user mode.
