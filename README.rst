==================
ansible-everything
==================

Ansible Everything
==================

This is currently going to serve as a brain dumping ground for various topics
about using `Ansible`_ for "All The Things". Eventually I will turn this into
a slide deck for a talk that can be given at conferences or meetups. This is
meant to be a talk that anyone with familiarity or experience with `Ansible`_
could give if they were so inclined. I hope to be able to author a first draft
that is useful but it will not be mine alone, I hope that members of the
community will add content based on their own experiences and that this can be
a presentation that anyone can use or modify.

The slide presentation will likely be put together using `hovercraft`_.

What is Ansible?
----------------

`Ansible`_ is a radically simple IT automation platform that makes your
applications and systems easier to deploy. Avoid writing scripts or custom code
to deploy and update your applications— automate in a language that approaches
plain English, using SSH, with no agents to install on remote systems

It can be thought of as a task orchestration utility that can be used for ad-hoc
task execution on one or many systems within an infrastructure. These tasks are
implemented as `modules`_ and can be combined into a simple series of tasks or
a complex workflows using what are known as `playbooks`_ and `roles`_.

Simply put, `Ansible`_ runs tasks on your systems (one or many) and can run many
tasks automatically when they are written down as a playbook.

Rendering the Presentation
--------------------------

You will first need to have `hovercraft`_ installed and in our path, you can
then run `make`_.

::

    make

You will now have a directory named ``out/`` which is where the rendered
presentation is, point your favorite web browser at this location or upload the
contents of that directory to somewhere that is served on the web and view it
from there.

To clean up.

::

    make clean

.. _Ansible: https://www.ansible.com/
.. _Kubernetes: http://kubernetes.io/
.. _OpenShift: https://www.openshift.org/
.. _hovercraft: https://github.com/regebro/hovercraft
.. _modules: http://docs.ansible.com/ansible/modules.html
.. _playbooks: http://docs.ansible.com/ansible/playbooks.html
.. _roles: http://docs.ansible.com/ansible/playbooks_roles.html
.. _ansible-container:
    https://github.com/ansible/ansible-container
.. _Zuul:
    http://lists.openstack.org/pipermail/openstack-dev/2016-June/097584.html

