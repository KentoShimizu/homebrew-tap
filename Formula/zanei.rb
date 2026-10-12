class Zanei < Formula
  desc "Local activity timeline for people and AI agents"
  homepage "https://github.com/KentoShimizu/zanei"
  url "https://github.com/KentoShimizu/zanei/releases/download/v0.7.0/zanei-0.7.0-macos-universal.tar.gz"
  sha256 "4efa779a94f69572dc204c4ad178b6c8ac5d00671ed046e93332e0d04f0e88ba"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  def install
    # Homebrew stages inside the archive's single root directory, so the
    # bundle usually arrives as a bare Contents/ tree.
    if File.directory?("Zanei.app")
      libexec.install "Zanei.app"
    else
      (libexec/"Zanei.app").install "Contents"
    end
    libexec.install "THIRD_PARTY_NOTICES.md"
    bin.install_symlink libexec/"Zanei.app/Contents/MacOS/zanei"
  end

  def post_install
    # tccutil can resolve only bundles registered with LaunchServices.
    system "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister",
           "-f", libexec/"Zanei.app"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/zanei --version")
  end
end
