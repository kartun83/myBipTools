var BipJSONTemplate = {
    Background: {
        Image: {
            X: 0,
            Y: 0,
            ImageIndex: 0
        }
    },
    Time: {
        Hours: {
            Tens: {
                X: 3,
                Y: 75,
                ImageIndex: 1,
                ImagesCount: 10
            },
            Ones: {
                X: 43,
                Y: 75,
                ImageIndex: 1,
                ImagesCount: 10
            }
        },
        Minutes: {
            Tens: {
                X: 93,
                Y: 75,
                ImageIndex: 1,
                ImagesCount: 10
            },
            Ones: {
                X: 135,
                Y: 75,
                ImageIndex: 1,
                ImagesCount: 10
            }
        }
    },
    Activity: {
        Steps: {
            TopLeftX: 5,
            TopLeftY: 5,
            BottomRightX: 170,
            BottomRightY: 60,
            Alignment: 20,
            Spacing: 0,
            ImageIndex: 11,
            ImagesCount: 10
        }
    },
    StepsProgress: {
        Linear: {
            StartImageIndex: 21,
            Segments: [{
                    X: 85,
                    Y: 63
                }, {
                    X: 94,
                    Y: 63
                }, {
                    X: 103,
                    Y: 63
                }, {
                    X: 112,
                    Y: 63
                }, {
                    X: 121,
                    Y: 63
                }, {
                    X: 130,
                    Y: 63
                }, {
                    X: 139,
                    Y: 63
                }, {
                    X: 148,
                    Y: 63
                }, {
                    X: 157,
                    Y: 63
                }, {
                    X: 166,
                    Y: 63
                }]
        }
    },
    Battery: {
        Text: {
            TopLeftX: 5,
            TopLeftY: 5,
            BottomRightX: 73,
            BottomRightY: 65,
            Alignment: 32,
            Spacing: 1,
            ImageIndex: 31,
            ImagesCount: 10
        },
        Icon: {
            X: 5,
            Y: 31,
            ImageIndex: 41,
            ImagesCount: 6
        }
    }
}
