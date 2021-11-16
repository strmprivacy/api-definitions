#!/usr/bin/env python
import pathlib
import pkg_resources
from datetime import datetime
from setuptools import setup, find_packages

with pathlib.Path('requirements.txt').open() as requirements_txt:
    install_requires = [
        str(requirement)
        for requirement
        in pkg_resources.parse_requirements(requirements_txt)
    ]

with open('VERSION') as version_file:
    parts = version_file.read().rstrip().split('-')

    if len(parts) > 1:
        # take version without git sha, because that's not allowed due to PEP440
        raw_version = parts[0]
        version = f'{raw_version}-dev{datetime.now().strftime("%Y%m%d%H%M")}'
    else:
        version = parts[0]

setup(
    author="Stream Machine B.V.",
    author_email='apis@strmprivacy.io',
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
    description="STRM Privacy API definitions",
    install_requires=install_requires,
    include_package_data=True,
    keywords='strmprivacy api definitions',
    name='strmprivacy-api-definitions',
    packages=find_packages(),
    setup_requires=[],
    version=version,
    zip_safe=False,
)
