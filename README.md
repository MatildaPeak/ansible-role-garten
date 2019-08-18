Ansible Role - matildapeak.garten
=================================

A Role for the installation of the Matilda Peak **garten** application into a
Kubernetes (or OpenShift) cluster.

-   Powered by [TfL Open Data]
-   The application contains OS data
    (c) Crown copyright and database rights 2016

Requirements
------------

-   Kubernetes or OpenShift 

Role Variables
--------------

    # The data collection period.
    # Must at lest 10 and be a divisor of 60, i.e. 10, 15, 20, 30 etc.
    collection_period_m: 10
    # Use bike cache.
    # Not a boolean - just 'yes' or 'no' strings.
    use_bike_cache: 'yes'
    
    # The URL where Chronicler can be located.
    # Here we're expecting it as a service in the
    # 'chronicler' namespace.
    chronicler_url: http://chronicler.chronicler.svc.cluster.local:9090
    # And the inbound resource path,
    # where inbound messages are posted...
    chronicler_resource: inbound
    
    # TfL (Transport for London) application credentials.
    # An ID and key for the TfL Unified API.
    tfl_app_id: SetMe
    tfl_app_key: SetMe
    
    # Sentry Data Source Name (DSN).
    # This is sensitive, it's optional.
    # The user needs to define it if events are to be passed to Sentry.
    # See https://sentry.io
    sentry_dsn: ''

    # NOTE: meta.name(space) comes from CR metadata
    #       when run with Ansible Operator
    #       deploy/crds has an example CR for reference
    name: "{{ meta.name|default('garten') }}"
    namespace: "{{ meta.namespace|default('garten') }}"
    
    # The image tag and pull policy
    image_tag: 2019.2
    image_pull_policy: IfNotPresent
    
    # To uninstall from the cluster
    # set state: absent
    state: present

Dependencies
------------

-   matildapeak.chronicler

Example Playbook
----------------

**NOTE** The example below assumes that you have a running Kubernetes|OpenShift
cluster and that you have sufficient permissions in the `garten` namespace.

    - hosts: servers
      tasks:
      - include_role:
          name: matildapeak.garten
        vars:
          image_tag: latest
          image_pull_policy: Always

License
-------

GPLv3 License

Author Information
------------------

Developed by Matilda Peak for its **Emergent Behaviour Platform** (tm)

[tfl open data]: https://tfl.gov.uk/info-for/open-data-users/
