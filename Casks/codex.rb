cask "codex" do
  arch arm: "aarch64", intel: "x86_64"
  os macos: "apple-darwin", linux: "unknown-linux-musl"

  version "0.159.1"
  sha256 arm:          "a8fc76ccb5230dd97fb6db01873fa9c12b5e1efdf32d13c2ba7f6e8489ccd893",
         intel:        "b8e8e6e403ed4357dfac2f2e5bba0f22df3e6a6962c68da792d6720a32e0842a",
         arm64_linux:  "63b3b5a4e76b4174d651d2d363ac028fdb4961ba47eca9946da3c35267999aec",
         x86_64_linux: "9a2dff8e1eb9bad83f52edb6f91175efeb5c68a316f880c95d7770f87a34fc5c"

  url "https://github.com/openai/codex/releases/download/rust-v#{version}/codex-package-#{arch}-#{os}.tar.gz"
  name "Codex"
  desc "OpenAI's coding agent that runs in your terminal"
  homepage "https://github.com/openai/codex"

  livecheck do
    url :url
    regex(/^rust[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  binary "bin/codex"
  generate_completions_from_executable "bin/codex", "completion"

  zap rmdir: "~/.codex"
end
