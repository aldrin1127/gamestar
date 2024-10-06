#!/bin/bash -e
_work_dir="$(pwd)"
cd "${_work_dir}/gamestar-ci"

# Clone-ups
_ci_clone() {
    git clone -f -b "${3}" "${1}" "${_work_dir}/${2}"
}
_ci_clone "https://github.com/TeamAmaze/AmazeFileManager.git" packages_apps_AmazeFileManager

# Apply for Gamestar AOSP
_patches="$(find . -name *.patch | sort -u | sed -e 's,./patches/,,')"
for patch in "${_patches}"; do
     pushd "${_work_dir}/$(dirname "${patch}")"
     patch -p1 <  "${_work_dir}/gamestar-ci/patches/${patch}"
     popd
done

for project in "${_work_dir}"/packages/apps/**; do
    pushd "${project}"
    ./gradlew generateBp
    popd
done

# Remove .git folder
rm -rf "${_work_dir}"/{external,packages/apps}/{Android.mk,.git}
