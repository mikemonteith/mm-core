import os
from setuptools import setup, find_packages

setup(
    name = "mm_core",
    version = "0.0.10",
    author = "Mike Monteith",
    author_email = "mike@mikemonteith.com",
    description = ("A core platform on top of wagtail, as a package test"),
    license = "BSD",
    keywords = "example core wagtail",
    url = "http://packages.python.org/an_example_pypi_project",
    packages=find_packages(),
    long_description="README file goes in here",
    classifiers=[
        "License :: OSI Approved :: BSD License",
    ],
    install_requires=[
        "Django>=1.11,<1.12",
        "wagtail>=1.13,<1.14"
    ]
)
