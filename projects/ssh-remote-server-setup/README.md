# Overview

This project is about setting up a remote server using SSH. The project is part of the DevOps track on [roadmap.sh](https://roadmap.sh).

## Steps Taken

This project created a server on DigitalOcean and set up SSH access to the server. The following steps were taken:

1. Created a droplet on DigitalOcean.
2. Generated an SSH key pair on the local machine.

   - To do this, I ran the command `ssh-keygen -t rsa -b 4096 -C`
   - The keypair was saved in the default location at `~/.ssh/id_rsa`

3. Copied the public key to the server.
4. Connected to the server using SSH with the following command
   - `ssh -i ~/.ssh/id_rsa root@<server-ip>`
5. Created a new user on the server.
   - To do this, I ran the command `adduser <username>`
   - I then ran the command `usermod -aG sudo <username>` to add the user to the sudo group.
   - Then, I ran the command `su - <username>` to switch to the new user.
   - To ensure that the new user can ssh into the server, I copied the public key to the new user's `~/.ssh/authorized_keys` file.
     - I ran the command `mkdir ~/.ssh`
     - I then ran the command `sudo vim ~/.ssh/authorized_keys`
     - I pasted the public key into the file and saved it.
     - I then ran the command `chmod 700 ~/.ssh` to set the permissions of the `.ssh` directory.
     - I then ran the command `chmod 600 ~/.ssh/authorized_keys` to set the permissions of the `authorized_keys` file.
     - I then ran the command `chown -R <username>:<username> ~/.ssh/authorized_keys` to set the owner of the `.ssh/authorized_keys` files and its contents to the new user.
     - I then ran the command `exit` to disconnect from the server.
     - I then reconnected to the server using the command `ssh -i ~/.ssh/id_rsa <username>@<server-ip>`
6. Disabled root login.
   - To do this, I ran the command `sudo vim /etc/ssh/sshd_config`
   - I then set `PermitRootLogin no`
   - I then restarted the SSH service with the command `sudo systemctl restart ssh`
7. I then confirmed that I could no longer log in as root by running the command `ssh -i ~/.ssh/id_rsa root@<server-ip>`.

## Bonus Points

Additionally, the project wanted us to look into setting up the configuration in ~/.ssh/config to allow you to connect to your server using the following command.

```bash
ssh <alias>
```

To do this, I created a `config` file in the `~/.ssh` directory on my local machine and added the following configuration:

```bash
Host <alias>
  HostName <server-ip>
  User <username>
  IdentityFile ~/.ssh/id_rsa
```

I then ran the command `ssh <alias>` to connect to the server.

### Overview of Commands Used in the Project

1. `ssh-keygen -t rsa -b 4096 -C`: Generates an SSH key pair.
   - `-t rsa`: Specifies the type of key to create.
   - `-b 4096`: Specifies the number of bits in the key.
   - `-C`: Provides a comment.
2. `ssh -i ~/.ssh/id_rsa root@<server-ip>`: Connects to the server using SSH.
   - `-i`: Specifies the identity file.
   - `~/.ssh/id_rsa`: Path to the private key.
3. `adduser <username>`: Adds a new user to the server.
4. `usermod -aG sudo <username>`: Adds the user to the sudo group.
   - `-aG`: Appends the user to the group.
5. `su - <username>`: Switches to the new user.
6. `chmod 700 ~/.ssh`: Sets the permissions of the `.ssh` directory.
   - `700`: Sets the permissions to read, write, and execute.
   - `600`: Sets the permissions to read and write.
7. `chown -R <username>:<username> ~/.ssh/authorized_keys`: Sets the owner of the `.ssh/authorized_keys` files and its contents to the new user.
   - `-R`: Recursively changes ownership.
