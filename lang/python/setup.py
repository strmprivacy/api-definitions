#!/usr/bin/env python
from setuptools import setup, find_packages

with open('VERSION') as version:
    readme = version.read()

setup(
    author="Stream Machine B.V.",
    author_email='apis@streammachine.io',
    python_requires='>=3.6',
    classifiers=[
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Intended Audience :: Developers',
        'Operating System :: OS Independent',
        'Topic :: Internet :: WWW/HTTP',
    ],
    description="Stream Machine API definitions",
    install_requires=[
        "grpcio==1.38.1"
    ],
    include_package_data=True,
    keywords='streammachine api definitions',
    name='streammachine-api-definitions',
    packages=find_packages(),
    setup_requires=[],
    version=version,
    zip_safe=False,
)
