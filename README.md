# Kong with ModSecurity

This is a Docker image for Kong (ubuntu) with ModSecurity 3.0.9 & ModSecurity-nginx 1.0.3 installed.

To update the ModSecurity version, please update the `MODSECURITY_VERSION` and `MODSECURITY_NGINX_VERSION` in the patch file.

To enable ModSecurity, please add the following to your `kong.conf`:

```conf
nginx_main_include=/modsecurity/loadmodule_modsecurity.conf
nginx_proxy_include=/modsecurity/enable_modsecurity.conf
```

The rules are located in `/modsecurity/coreruleset/`, from the [OWASP ModSecurity Core Rule Set](https://github.com/coreruleset/coreruleset).
