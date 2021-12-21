#pragma once

#include <QObject>
#include <QVideoFrame>

#include "BaseProcessingHandler.h"

#include "Domain/Video/IDataProvider.h"
#include "Domain/Video/IDataProcessor.h"

#include "../Models/ProcessedVideo.h"

class VideoProcessingHandler : public QObject, public BaseProcessingHandler<int, float, ProcessedVideo>
{
    Q_OBJECT

public:
    VideoProcessingHandler(
        std::unique_ptr<IDataProvider<int>> provider,
        std::unique_ptr<IDataProcessor<int, float>> processor,
        bool withProcessing = true);
    virtual ~VideoProcessingHandler() = default;

protected:
    bool convertProcessedToOutput(const float &data, ProcessedVideo &result) override;
    bool convertInputToOutput(const int &data, ProcessedVideo &result) override;
    void resultReadyCallback(const ProcessedVideo &result) override;

private slots:
    void statusChangedHandler(int value);

signals:
    void dataReady(ProcessedVideo frame);
    void statusChanged(BaseProcessingHandler<int, float, ProcessedVideo>::Status status);
};
