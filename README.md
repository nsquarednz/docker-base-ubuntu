# nsquarednz/base-ubuntu

### Based upon [Ubuntu Linux](https://hub.docker.com/_/ubuntu/) and [S6 overlay](https://github.com/just-containers/s6-overlay), this serves as a base template container for all other docker containers created by nsquarednz.

![ubuntu](https://logos-download.com/wp-content/uploads/2016/02/Ubuntu_logo.png)


## Features:

|                          |                          |
| ------------------------ | ------------------------ |
| Base:                    | Ubuntu                   |
| Init:                    | s6 overlay               |
| Additinal applications:  | bash-completion          |
|                          | ca-certificates          |
|                          | coreutils                |
|                          | curl                     |
|                          | nano                     |
|                          | tar                      |
|                          | tzdata                   |
|                          | unzip                    |
|                          | xz-utils                 |
|                          | vim                      |
|                          |                          |


## Configuration:

* Configuration is stored in /config/
* Application binaries can be installed to /app
* Default user name "docker"
* Hosts file configurable in /config/hosts

Additional params to your container:
* `-e PGID` for setting the GroupID of the default user
* `-e PUID` for setting the UserID of the default user
