## Usage
To use this overlay, make the following changes in `/etc/layman/layman.cfg`:  
```txt
...
overlays  :
    https://api.gentoo.org/overlays/repositories.xml
    https://raw.githubusercontent.com/shunlir/shunlir-gentoo-overlay/master/repo-shunlir.xml
...
```
Then:  

``` sh
layman -S
layman -a shunlir
```
