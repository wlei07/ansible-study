ansible-config list # List all configurations
ansible-config view # Shows the current config file
ansible-config dump # Shows the current settings
export ANSIBLE_GATHERING=explicit
ansible-config dump | grep GATHERING
# output: DEFAULT_GATHERING(env: ANSIBLE_GATHERING) = explicit

ansible-playbook ./playbook.yml --syntax-check
ansible-playbook ./playbook.yml --check
ansible-playbook ./playbook.yml --check --diff

ansible-lint ./playbook.yml

# create an ansible role:
ansible-galaxy init apache
