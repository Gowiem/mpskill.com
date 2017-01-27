# Docker + Nginx + Let's Encrypt -- Website Template
A template for using Docker, Nginx, and Let's Encrypt to create simple websites.

## Requirements

1. [Ansible](https://docs.ansible.com/ansible/intro_installation.html#getting-ansible)

## TODOs

Suggested to just search the project for 'TODO' :)

1. Update `src/humans.txt`
2. Update the TODOs in `src/index.html`
  1. Title
  2. Description
  3. Google Analytics ID
  4. Body
3. Update the TODOs in `deploy.yml`
  1. Add repo URL
  2. Add domain to Let's Encrypt command
4. Update `hosts` to use the hostname/ip of your web server.
5. Add maintainer to `Dockerfile`

## Install Instructions

1. `ansible-playbook -i hosts deploy.yml`
