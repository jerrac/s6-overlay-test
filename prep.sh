#!/command/with-contenv bash
sed -i s/FOO_VALUE/"${FOO_VALUE}"/g /opt/config
sed -i s/FOO_PASS/"${FOO_PASS}"/g /opt/config
sed -i s/FOO_HELLO/"${FOO_HELLO}"/g /opt/config