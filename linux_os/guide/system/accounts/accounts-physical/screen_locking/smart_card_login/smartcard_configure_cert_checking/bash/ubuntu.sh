# platform = multi_platform_ubuntu

if [ ! -f /etc/pam_pkcs11/pam_pkcs11.conf ]; then
    cp /usr/share/doc/libpam-pkcs11/examples/pam_pkcs11.conf.example /etc/pam_pkcs11/pam_pkcs11.conf
fi

if grep -v "^\s*\#+cert_policy" /etc/pam_pkcs11/pam_pkcs11.conf | grep -qv "ocsp_on"; then
    sed -i "s/\(^[[:blank:]]*\)\(\(\#*[[:blank:]]*cert_policy[[:blank:]]*=[[:blank:]]*.*;\)[^ $]*\)/\1cert_policy = ca,signature,ocsp_on;/" /etc/pam_pkcs11/pam_pkcs11.conf
fi
