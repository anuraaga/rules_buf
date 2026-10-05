# Copyright 2021-2025 Buf Technologies, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""rules_buf dependencies"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

bazel_dependencies = {
    # Bazel 8 loads rules_java, rules_python, rules_cc, and bazel_skylib from its
    # WORKSPACE prefix and suffix, so the pins below must be new enough for it.
    # protobuf_deps() (see README) only fetches repositories that are not
    # already defined.
    "bazel_skylib": {
        "sha256": "d00f1389ee20b60018e92644e0948e16e350a7707219e7a390fb0a99b6ec9262",
        "urls": [
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.0/bazel-skylib-1.7.0.tar.gz",
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.0/bazel-skylib-1.7.0.tar.gz",
        ],
    },
    "bazel_features": {
        "sha256": "2cd9e57d4c38675d321731d65c15258f3a66438ad531ae09cb8bb14217dc8572",
        "strip_prefix": "bazel_features-1.11.0",
        "urls": [
            "https://github.com/bazel-contrib/bazel_features/releases/download/v1.11.0/bazel_features-v1.11.0.tar.gz",
        ],
    },
    "rules_java": {
        "sha256": "c5bc17e17bb62290b1fd8fdd847a2396d3459f337a7e07da7769b869b488ec26",
        "urls": [
            "https://github.com/bazelbuild/rules_java/releases/download/8.6.1/rules_java-8.6.1.tar.gz",
        ],
    },
    "rules_python": {
        "sha256": "fa7dd2c6b7d63b3585028dd8a90a6cf9db83c33b250959c2ee7b583a6c130e12",
        "strip_prefix": "rules_python-1.6.0",
        "urls": [
            "https://github.com/bazel-contrib/rules_python/releases/download/1.6.0/rules_python-1.6.0.tar.gz",
        ],
    },
    "rules_cc": {
        "sha256": "f4aadd8387f381033a9ad0500443a52a0cea5f8ad1ede4369d3c614eb7b2682e",
        "strip_prefix": "rules_cc-0.0.15",
        "urls": [
            "https://github.com/bazelbuild/rules_cc/releases/download/0.0.15/rules_cc-0.0.15.tar.gz",
        ],
    },
    "rules_license": {
        "sha256": "4531deccb913639c30e5c7512a054d5d875698daeb75d8cf90f284375fe7c360",
        "urls": [
            "https://github.com/bazelbuild/rules_license/releases/download/0.0.7/rules_license-0.0.7.tar.gz",
        ],
    },
    "com_google_protobuf": {
        "sha256": "3d32940e975c4ad9b8ba69640e78f5527075bae33ca2890275bf26b853c0962c",
        "strip_prefix": "protobuf-29.1",
        "urls": [
            "https://github.com/protocolbuffers/protobuf/releases/download/v29.1/protobuf-29.1.tar.gz",
        ],
    },
}

def rules_buf_dependencies():
    """Utility method to load all dependencies of `rules_buf`."""
    for name in bazel_dependencies:
        maybe(http_archive, name, **bazel_dependencies[name])
