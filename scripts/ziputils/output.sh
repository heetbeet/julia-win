#!/bin/bash
FILE="$(readlink -f "$0")"

searchstr="__BEGIN""_PAYLOAD__"
strindex="$(grep -aob "$searchstr" --color=never "$FILE" | \grep -oE '^[0-9]+' )"
payloadindex=`expr $strindex + ${#searchstr}`

dd bs=4096 skip=$payloadindex iflag=skip_bytes if="$FILE" of="$FILE-output"

exit 0
__BEGIN_PAYLOAD__PK    �[�RA��E�   8     bllooop/blabla.shM�OK1�����@+%t"��C�U
E��ҤI��e�T����ĺ��0o����ҴS)®,n˚!{-Tc�=� ��ˢ,�~��3����[�#�����a~�y:I�i��2b�*�L��#�k�X�Z��}��#�'���m����^'#ȮN+�	�ҝ�@z� ���_�R)��]V�+{��O �iĖe��c�!-X��#�����L��,~���PK     �[�R               bllooop/blabla.sh-outputPK    �X�R-���   Q     bllooop/blabla--unix.shM��K�0���W�g�Vu2�0q�`��'_���]hIKs���ZZX��G�s��^^,���A<mw�ɬu�V>� s�$�9
a\�C�OU��B)%���y����~��{]?�P�H��W�F}C�����6�>X�͒�
�|�:O����U������5��LT���b�����W�P}�˜�E.�q�)����#���@&�ō�K1=:��f*F��}puN�#��Jm�0M�rt��PK     �X�R���L         bllooop/blabla--unix.sh-output--BEGIN-PAYLOAD---PK     �[�RA��E�   8                  bllooop/blabla.shPK      �[�R                           bllooop/blabla.sh-outputPK     �X�R-���   Q              E  bllooop/blabla--unix.shPK      �X�R���L                  i  bllooop/blabla--unix.sh-outputPK        �    