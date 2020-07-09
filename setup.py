from distutils.core import setup

setup(
    name="scripture-burrito",
    packages=["scripture_burrito"],
    package_dir={"scripture_burrito": "code"},
    package_data={"schema": ["schema/*"]},
    version="0.2.0b2",
    license="MIT",
    description="Schema support for the Scripture-Burrito format",
    author="BT Tech Consortium",
    author_email="smorrison@biblesocieties.org",
    maintainer="Sean Morrison",
    maintainer_email="smorrison@biblesocieties.org",
    url="https://github.com/bible-technology/scripture-burrito",
    download_url="https://github.com/bible-technology/scripture-burrito/releases/tag/v0.2.0-beta",
    keywords=["Scripture-Burrito", "Scripture", "Burrito",],
    install_requires=["sphinx", "sphinx_rtd_theme", "sphinx-jsonschema", "jsonschema"],
    classifiers=[
        "Development Status :: 4 - Beta",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Programming Language :: Python :: 3",
    ],
)
