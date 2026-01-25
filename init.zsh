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
# Function: str str = p6df::modules::akuity::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 HOME P6_AKUITY_ORG_ROLE_CACHE P6_DFZ_PROFILE_AKUITY
#>
######################################################################
p6df::modules::akuity::prompt::mod() {

  local str

  local id_org_role
  if ! p6_string_blank "$P6_DFZ_PROFILE_AKUITY"; then
    str="akuity:\t\t $P6_DFZ_PROFILE_AKUITY:"
    if ! p6_string_blank "$P6_AKUITY_ORG_ROLE_CACHE"; then
      str=$(p6_string_append "$str" "$P6_AKUITY_ORG_ROLE_CACHE" " ")
    else
      local mtime=$(p6_file_mtime "$HOME/.config/akuity/config.yaml")
      local now=$(p6_date_point_now_epoch_seconds)
      local diff=$(p6_math_sub "$now" "$mtime")

      if p6_math_lt "$diff" "86400"; then
        local org_name=$(akuity organization list | p6_filter_row_last 1 | p6_filter_column_pluck 2)
        p6_env_export "P6_AKUITY_ORG_ROLE_CACHE" "$org_name"
        str=$(p6_string_append "$str" "$P6_AKUITY_ORG_ROLE_CACHE" " ")
      fi
    fi
  fi

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
