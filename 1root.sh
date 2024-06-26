#!/bin/bash
#
# Encrypted by Rangga Fajar Oktariansyah (Anak Gabut Thea)
#
# This file has been encrypted with BZip2 Shell Exec <https://github.com/FajarKim/bz2-shell>
# The filename '1root.sh' encrypted at Wed Apr  3 05:02:08 UTC 2024
# I try invoking the compressed executable with the original name
# (for programs looking at their name).  We also try to retain the original
# file permissions on the compressed file.  For safety reasons, bzsh will
# not create setuid or setgid shell scripts.
#
# WARNING: the first line of this file must be either : or #!/bin/bash
# The : is required for some old versions of csh.
# On Ultrix, /bin/bash is too buggy, change the first line to: #!/bin/bash5
#
# Don't forget to follow me on <https://github.com/FajarKim>
skip=75

tab='	'
nl='
'
IFS=" $tab$nl"

# Make sure important variables exist if not already defined
# $USER is defined by login(1) which is not always executed (e.g. containers)
# POSIX: https://pubs.opengroup.org/onlinepubs/009695299/utilities/id.html
USER=${USER:-$(id -u -n)}
# $HOME is defined at the time of login, but it could be unset. If it is unset,
# a tilde by itself (~) will not be expanded to the current user's home directory.
# POSIX: https://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap08.html#tag_08_03
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# macOS does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

bztmpdir=
trap 'res=$?
  test -n "$bztmpdir" && rm -fr "$bztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  bztmpdir=`mktemp -d "${TMPDIR}bztmpXXXXXXXXX"`
else
  bztmpdir=${TMPDIR}bztmp$$; mkdir $bztmpdir
fi || { (exit 127); exit 127; }

bztmp=$bztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$bztmp" && rm -r "$bztmp";;
*/*) bztmp=$bztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | bzip2 -cd > "$bztmp"; then
  umask $umask
  chmod 700 "$bztmp"
  (sleep 5; rm -fr "$bztmpdir") 2>/dev/null &
  "$bztmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n' "Cannot decompress ${0##*/}"
  printf >&2 '%s\n' "Report bugs to <fajarrkim@gmail.com>."
  (exit 127); res=127
fi; exit $res
BZh91AY&SYϚY$  ����}�����_/����g���wW������ԦBB܁�)�z
j�Sm��A��$��3H���M �=4����Hڍ154i�A%&D�F�e=@�@�P dz�4�� �h    �EF�    �        d LL�	�14i��0�#Fi� �  �4` I)�4h&y6����4�� �h�C@ �  �BT��Mz�Ò�Uŉ���n��1�����)2[�{P b  4H$RH �%��i$��&�!qr&f蓜C�&L�2<Rk.��'M��gQ���m�ǃ�x�|�g5�����g>�s��Q�{d�&ȃrL�FfD�thY�M�-)yB韲ݭ�O�. A%�`+���+���,3&]�,'+��0�q�8�R���8�1�p\1����D��
1@d>V�`2F�L�-��+!^�A���,�?2ZI�g 2��4κ��Ex�t��)#L�����j�}V��W,f%&i
�V��A\��6��� �*�)AMUQs�d�E� a�M¯��Eq�B#�$������3���Y�=
�њ��bi|T�	�
AHQhD��ӆ�z�����1����Іs��;Y��8��%[	��Q�V<�q |�#�+���L�*��Â�p���*XB�Е�Vc�*��#YK�*vBPfQ���+WX��E��`b�B��M'"��L� 1Y�R�AH�J�\jȄ_Oх|�)�#*��F��!�������B��s0D�&�Ԇ�e�{s��&�:ר���0䲯��^%C�}��;��֞RL>X��G��P8�'���sZ���43�\�����5SXAw��>�9���m���UDA �1�*f�������|�� ����f0\�}��1!��z�_���3���HBE��Ҫ�x��l̃+j-n�����ls7Y=�BJ32�Ͷs�� 8�o��\Z$� �<�R04�H �A%ӿ'�����	����,QE7ִ���R�� ���b�I�
�Y�O��=�d��bc0f��.�&:��ğ�>V)9���9�/Ez<G�Sz8���1�.�p�!�4�H