include:
  - base
  - nginx

logserver-base:
  cmd.run:
    - name: wget -O - https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add -

  pkgrepo.managed:
    - humanname: Logstash
    - name: deb http://packages.elasticsearch.org/logstash/1.4/debian stable main
    - file: /etc/apt/sources.list.d/logstash.list

  pkg.installed:
    - pkgs:
      - logstash

  service.running:
    - name: logstash
    - enable: True

elasticsearch-base:
  pkgrepo.managed:
    - humanname: Elasticsearch
    - name: deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main
    - file: /etc/apt/sources.list.d/elasticsearch.list

  pkg.installed:
    - pkgs:
      - elasticsearch

  service.running:
    - name: elasticsearch
    - enable: True
    - watch:
      - file: /etc/elasticsearch/*

kibana-base:
  archive.extracted:
    - name: /opt/
    - source: https://download.elasticsearch.org/kibana/kibana/kibana-3.1.2.tar.gz
    - source_hash: sha1=a59ea4abb018a7ed22b3bc1c3bcc6944b7009dc4
    - archive_format: tar
    - if_missing: /opt/kibana-3.1.2/

  file.append:
    - name: /etc/elasticsearch/elasticsearch.yml
    - text: |
        http.cors.enabled: true

{% set configname = 'kibana' %}

/etc/nginx/sites-available/{{ configname }}:
  file.managed:
    - source: salt://{{ configname }}-nginx
    - template: jinja

/etc/nginx/sites-enabled/{{ configname }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ configname }}
