class Zanei < Formula
  desc "Local activity timeline for people and AI agents"
  homepage "https://github.com/KentoShimizu/zanei"
  version "0.3.1"
  license "MIT OR Apache-2.0"
  depends_on :macos

  url "https://github.com/KentoShimizu/zanei/releases/download/v#{version}/zanei-#{version}-macos-universal.tar.gz"
  sha256 "b29d59722625fdd42985507c2e1e749091e593c24fffde7e85f4771499473c39"

  def install
    # Homebrew stages inside the archive's single root directory, so the
    # bundle usually arrives as a bare Contents/ tree.
    if File.directory?("Zanei.app")
      libexec.install "Zanei.app"
    else
      (libexec/"Zanei.app").install "Contents"
    end
    libexec.install "THIRD_PARTY_NOTICES.md" if File.exist?("THIRD_PARTY_NOTICES.md")
    bin.install_symlink libexec/"Zanei.app/Contents/MacOS/zanei"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanei --version")
  end
end
