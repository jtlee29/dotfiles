# AWS Profile Switcher
# Source this file in your .zshrc: source ~/.dotfiles/zsh/aws-profile.zsh

aws-profile() {
  local profile

  # Get list of profiles from AWS config/credentials files
  local profiles=()
  if [[ -f ~/.aws/credentials ]]; then
    profiles+=($(awk -F'[][]' '/^\[/ {print $2}' ~/.aws/credentials 2>/dev/null))
  fi
  if [[ -f ~/.aws/config ]]; then
    profiles+=($(awk '/^\[profile / {gsub(/\[profile |\]/, ""); print}' ~/.aws/config 2>/dev/null))
  fi

  # Remove duplicates and sort
  profiles=($(printf '%s\n' "${profiles[@]}" | sort -u))

  if [[ ${#profiles[@]} -eq 0 ]]; then
    echo "No AWS profiles found in ~/.aws/credentials or ~/.aws/config"
    return 1
  fi

  # If a profile name is provided as argument, use it directly
  if [[ -n "$1" ]]; then
    if (( ${profiles[(Ie)$1]} )); then
      export AWS_PROFILE="$1"
      echo "Switched to AWS profile: $AWS_PROFILE"
      return 0
    else
      echo "Profile '$1' not found. Available profiles:"
      printf '  %s\n' "${profiles[@]}"
      return 1
    fi
  fi

  # Interactive selection
  if command -v fzf &>/dev/null; then
    # Use fzf if available
    profile=$(printf '%s\n' "${profiles[@]}" | fzf --prompt="Select AWS profile: " --height=40% --reverse)
  else
    # Fallback to select menu
    echo "Select AWS profile:"
    select profile in "${profiles[@]}" "Cancel"; do
      if [[ "$profile" == "Cancel" ]]; then
        echo "Cancelled"
        return 0
      elif [[ -n "$profile" ]]; then
        break
      fi
    done
  fi

  if [[ -n "$profile" ]]; then
    export AWS_PROFILE="$profile"
    echo "Switched to AWS profile: $AWS_PROFILE"
  fi
}

# Show current AWS profile
aws-profile-current() {
  if [[ -n "$AWS_PROFILE" ]]; then
    echo "Current AWS profile: $AWS_PROFILE"
  else
    echo "No AWS_PROFILE set (using default)"
  fi
}

# Clear AWS profile (revert to default)
aws-profile-clear() {
  unset AWS_PROFILE
  echo "AWS_PROFILE cleared (using default)"
}
