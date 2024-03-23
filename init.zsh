# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::akuity::deps()
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

  p6df::modules::homebrew::cli::brew::install akuity

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::akuity::prompt::line()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6df::modules::akuity::prompt::line() {

  local str="akuity:\t\t "
  #  local id_org_role=$(
  #    akuity organization list | tail -1 | sed -e 's,  *,/,g'
  #  )
  local id_org_role="akuity/pgollucci"
  str=$(p6_string_append "$str" "$id_org_role")

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::akuity::clones()
#
#  Environment:	 P6_DFZ_SRC_FOCUSED_DIR
#>
######################################################################
p6df::modules::akuity::clones() {

  p6_github_login_clone akuity "$P6_DFZ_SRC_FOCUSED_DIR"

  p6_return_void
}
