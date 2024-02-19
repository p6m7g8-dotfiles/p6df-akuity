# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::arkestro::deps()
#
#>
######################################################################
p6df::modules::akuity::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6df-argocd
  )
}

######################################################################
#<
#
# Function: p6df::modules::akuity::external::brew()
#
#>
######################################################################
p6df::modules::akuity::external::brew() {

  brew install akuity

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::akuity::init(dir)
#
#  Args:
#	dir -
#
#>
######################################################################
p6df::modules::akuity::init() {
  local dir="$1"

  p6_return_void
}

######################################################################
#<
#
# Function: str info = p6df::modules::akuity::prompt::line()
#
#  Returns:
#	str - info
#
#>
######################################################################
p6df::modules::akuity::prompt::line() {

  local info="akuity:\t\t "
  #  local id_org_role=$(
  #    akuity organization list | tail -1 | sed -e 's,  *,/,g'
  #  )
  local id_org_role="akuity/pgollucci"
  info=$(p6_string_append "$info" "$id_org_role")

  p6_return_str "$info"
}

######################################################################
#<
#
# Function: p6df::modules::akuity::clones()
#
#  Environment:	 P6_DFZ_SRC_DIR
#>
######################################################################
p6df::modules::akuity::clones() {

  p6_github_login_clone akuity "$P6_DFZ_SRC_DIR"

  p6_return_void
}
