const path = require('path');
const nodeExternals = require('webpack-node-externals');

module.exports = {
    mode: 'production',
    optimization: {
        minimize: true
    },
    module: {
        rules: [
            {
                test: /\.tsx?$/,
                use: 'ts-loader',
                exclude: /node_modules/,
            }
        ],
    },
    resolve: {
        extensions: ['.js', '.ts', '.tsx', '.d.ts']
    },
    target: 'web',
    externals: [nodeExternals()],
    entry: './build/index.ts',
    output: {
        filename: '[name].js',
        libraryTarget: 'umd',
        library: 'ApiDefinitions',
        umdNamedDefine: true,
        path: path.resolve(__dirname, 'dist')
    }
};
