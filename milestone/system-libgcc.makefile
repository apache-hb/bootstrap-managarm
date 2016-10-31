
f := system-libgcc
b := system-gcc

$f_RUNPKG := $s/runpkg $B/hostpkg cross-binutils
$f_RUNPKG += $s/runpkg $B/hostpkg system-gcc

$f_MAKE_ALL := make all-target-libgcc
$f_MAKE_INSTALL := make install-target-libgcc

.PHONY: install-$f
install-$f: f := $f
install-$f: b := $b

install-$f: | $(call milestone_tag,install-$b)
	cd $B/host/$b && $($f_RUNPKG) $($f_MAKE_ALL) && $($f_RUNPKG) $($f_MAKE_INSTALL)
	touch $(call milestone_tag,install-$f)

$(call milestone_tag,install-$f): f := $f
$(call milestone_tag,install-$f):
	make install-$f
