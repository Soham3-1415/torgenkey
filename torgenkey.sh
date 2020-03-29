#!/bin/bash
OPENSSL_PRIV="$(openssl genpkey -algorithm x25519)"

echo -n "$1":descriptor:x25519:
echo "$OPENSSL_PRIV" | head -2 | tail -1 | base64 -d | tail --bytes=32 | base32 | sed 's/=//g'

echo -n descriptor:x25519:
echo "$OPENSSL_PRIV" | openssl pkey -pubout | tail -2 | head -1 | base64 -d | tail --bytes=32 | base32 | sed 's/=//g'
